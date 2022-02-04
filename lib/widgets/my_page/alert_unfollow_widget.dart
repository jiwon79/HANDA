import 'package:flutter/material.dart';

void alertUnfollowWidget(context, user) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(17.0)
            )
          ),
          contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 0),
          content: Container(
            width: 400,
            height: 170,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30)
                    ),
                    color: Colors.indigoAccent,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 7, 0, 4),
                  child: Text('팔로워를 삭제하시겠습니까?',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text('${user.username} 님은 회원님의 팔로워 리스트에서\n삭제된 사실을 알 수 없습니다.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text("취소",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text("삭제",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                          color: Color(0xffff3939),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }
  );
}