import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/question_model.dart';
import 'package:flutter_templete/core/data/models/subjects_model.dart';
import 'package:flutter_templete/core/data/reposotories/question_repository.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/data/models/college_model.dart';
import '../../../core/data/reposotories/college_repository.dart';
import '../../shared/custom_widgets/custom_toast.dart';

class HomeViewController extends BaseController {
  RxDouble currentIndex = 0.0.obs;
  RxInt currentMajorIndex = (-1).obs;
  RxBool showSubjects = false.obs;
  RxInt questionIndex = 0.obs;
  RxInt currentQuestion = 0.obs;
  RxInt totalQuestions = 99.obs;

  void increaseProgress() {
    currentQuestion.value = (currentQuestion.value + 1) % totalQuestions.value;
  }

  void decreaseProgress() {
    currentQuestion.value = currentQuestion.value >= 1
        ? (currentQuestion.value - 1) % totalQuestions.value
        : currentQuestion.value;
  }

  RxString progressFactor = ''.obs;
  var selected = -1;
  // MainViewController mainViewController = Get.find<MainViewController>();

  @override
  void onInit() {
    progressFactor.value =
        '${currentQuestion.value + 1} / ${totalQuestions.value}';

    getAllColleges();
    getEngColleges();
    getMedColleges();

    super.onInit();
  }

  RxList<CollegeModel> allColleges = <CollegeModel>[].obs;
  RxList<CollegeModel> engColleges = <CollegeModel>[].obs;
  RxList<CollegeModel> medColleges = <CollegeModel>[].obs;
  RxList<SubjectModel> collegeSubjects = <SubjectModel>[].obs;
  RxList<QuestionModel> bookQuestions = <QuestionModel>[].obs;

  getCollegeSubjects({required collegeID}) {
    collegeSubjects.clear();
    runLoadingFutureFunction(
        function: CollegeRepository()
            .getCollegeSubjects(collegeID: collegeID)
            .then((value) => value.fold(
                (l) => CustomToast.showMessage(message: l),
                (r) => collegeSubjects.addAll(r))));
  }

  getBookQuestions({required collegeID}) {
    bookQuestions.clear();
    runLoadingFutureFunction(
        function: QuestionsRepository()
            .getBookQuestions(collegeID: collegeID)
            .then((value) => value.fold(
                (l) => CustomToast.showMessage(message: l),
                (r) => bookQuestions.addAll(r))));
  }

  getAllColleges() {
    allColleges.clear();

    runLoadingFutureFunction(
        function: CollegeRepository().getAllColleges().then((value) =>
            value.fold((l) => CustomToast.showMessage(message: l),
                (r) => allColleges.addAll(r))));
  }

  getEngColleges() {
    engColleges.clear();

    runLoadingFutureFunction(
        function: CollegeRepository().getEngColleges().then((value) =>
            value.fold((l) => CustomToast.showMessage(message: l),
                (r) => engColleges.addAll(r))));
  }

  getMedColleges() {
    medColleges.clear();

    runLoadingFutureFunction(
        function: CollegeRepository().getEngColleges().then((value) =>
            value.fold((l) => CustomToast.showMessage(message: l),
                (r) => engColleges.addAll(r))));
  }

  TextEditingController searchController = TextEditingController();

  void monitorDotsState() {
    // currentIndex.value != 2 ? currentIndex += 1 : null;
  }
}
