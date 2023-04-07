import 'package:collection/collection.dart';
import 'package:erinet_app/components/custom_button.dart';
import 'package:erinet_app/components/flexible_textfield.dart';
import 'package:erinet_app/utils/route_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/custom_rating_bar.dart';
import '../components/custom_widgets.dart';
import '../components/new_custom_dialog.dart';
import '../model/chat_model.dart';
import '../utils/string_utils.dart';

class ChatController extends GetxController {
  final TextEditingController sendMessageTextController =
      TextEditingController();

  RxDouble rating = 0.0.obs;

  GlobalKey<FormState> sendRequestFormKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();

  final chatScrollController = ScrollController();
  bool isSocketConnected = false;
  RxBool isChatHistoryLoading = false.obs;
  ChatModel chatHistoryModel = ChatModel();
  ChatData chatData = ChatData();
  RxList<ChatData> chatList = <ChatData>[
    ChatData(
      senderId: "123",
      senderType: "driver",
      receiverId: 9.toString(),
      message: "hi",
      createdAt: DateTime.now(),
    ),
    ChatData(
      senderId: "123",
      senderType: "driver",
      receiverId: 9.toString(),
      message: "your number is incorrect\nplease provide correct number",
      createdAt: DateTime.now(),
    ),
    ChatData(
      senderId: "123",
      senderType: "asd",
      receiverId: 9.toString(),
      message: "Hii, Ok I am sending you correct number",
      createdAt: DateTime.now(),
    ),
  ].obs;

  RxMap<String, List<ChatData>> chatGroupMap = <String, List<ChatData>>{}.obs;

  // late var chatGroupList;

  @override
  void onInit() {
    super.onInit();
    filterChatList();
  }

  sendMessage() {
    if (sendMessageTextController.text.isNotEmpty) {
      ChatData chatData = ChatData();
      chatData = ChatData(
        senderId: "123",
        senderType: "driver",
        receiverId: 9.toString(),
        message: sendMessageTextController.text,
        createdAt: DateTime.now(),
      );
      chatList.add(chatData);
      filterChatList();
      sendMessageTextController.clear();
      scrollToBottom();
    }
  }

  void scrollToBottom() {
    final bottomOffset = chatScrollController.position.minScrollExtent;
    chatScrollController.animateTo(
      bottomOffset,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  filterChatList() {
    chatGroupMap.value = {};
    chatGroupMap.value =
        groupBy(chatList.reversed, (e) => getDate(e.createdAt));
    update();
  }

  onAppBarBack() async {
    Get.dialog(
      Obx(
        () => CustomDialog(
          icon: Icons.rate_review_outlined,
          primaryLabel: rateAgentSUtil,
          secondaryLabel: cancelSUtil,
          primaryTap: Get.back,
          title: rateAgentSUtil,
          label: rateAgentDescSUtil,
          // child: CustomRatingBar.getCustomRatingBar(),
          child: CustomRatingBar(
            rating: rating.value,
            onRatingChanged: (rating) => this.rating.value = rating,
            iconSize: sizeW(30),
          ),
        ),
      ),
    ).then((value) => Get.back());
  }

  void onCloseChat() async {
    Get.dialog(
      Obx(
            () => CustomDialog(
          icon: Icons.rate_review_outlined,
          primaryLabel: rateAgentSUtil1,

          secondaryLabel: cancelSUtil,
          primaryTap: (){
            sendRequestDialogBox();
          },
             secondaryTap: ()=> Navigator.pop(Get.context!),
          title: rateAgentSUtil1,
          label: rateAgentDescSUtil,
          // child: CustomRatingBar.getCustomRatingBar(),
          child: CustomRatingBar(
            rating: rating.value,
            onRatingChanged: (rating) => this.rating.value = rating,
            iconSize: sizeW(30),
          ),
        ),
      ),
    ).then((value) => Get.back());
  }

   sendRequestDialogBox() {
    Get.defaultDialog(
        title: "Comments",
        titleStyle: TextStyle(color: Colors.black),
        content: Form(
          key: sendRequestFormKey,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlexibleTextField(
                label: "Write",
                textController: _descriptionController,
                height: Get.height * 0.2,
                width: Get.width * 0.9,
                maxLines: 50,
              ),
              const SizedBox(height: 20),

              Container(
                height: Get.height * 0.06,
                width: Get.width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  label: "Submit",
                  isSelected: false,
                  onTap: () {
                    Get.toNamed(kAgentHomeScreen);
                  },
                ),
              )
            ],
          ),
        )).then((value) {
      _descriptionController.clear();
      _descriptionController.clear();
    });
  }

  CustomContainer(){
    Container(
      height: 50,width: 50,
      color: Colors.red,
    );
  }

  retryCall() {
    Get.back();
  }

  redialCall() {
    Get.back();
  }

  endCall() {
    Get.back();
  }
}
