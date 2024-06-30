import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class QuestionAnswerWidget extends StatefulWidget {
  final String question;
  final String answer;

  const QuestionAnswerWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.screedWidth,
  });
  final double screedWidth;
  @override
  QuestionAnswerWidgetState createState() => QuestionAnswerWidgetState();
}

class QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  bool isAnswerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(.3)),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isAnswerVisible = !isAnswerVisible;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: widget.screedWidth * .7,
                      child: Text(
                        /// maxLines: 5,
                        ///   overflow: TextOverflow.ellipsis,
                        widget.question,
                        style: AppStyles.styleInterSemiBold20(context),
                      ),
                    ),
                    Icon(
                      isAnswerVisible
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            if (isAnswerVisible)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  widget.answer,
                  style: AppStyles.styleInterRegular18(context),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
