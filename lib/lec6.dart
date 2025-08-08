import 'package:flutter/material.dart';

class Lec6 extends StatefulWidget {
  static const String path = '/lec6';
  const Lec6({super.key});

  @override
  State<Lec6> createState() => _Lec6State();
}

class _Lec6State extends State<Lec6> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'Inter', appBarTheme: AppBarTheme(backgroundColor: AppColors.backGroundColor)),
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          titleSpacing: 0,
          leading: Image.asset(AppImages.appBarImage),
          actions: [
            Image.asset(AppImages.qrCode),
            SizedBox(width: 18),
            Image.asset(AppImages.camera),
            SizedBox(width: 29),
            Image.asset(AppImages.menu),
          ],
          title: Text(
            'WhatsApp',
            style: AppTextStyles.s20W600White,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: AppColors.fieldColor,
                    filled: true,
                    hintText: 'Ask Meta AI or Search',
                    hintStyle: AppTextStyles.s15W500.copyWith(color: AppColors.fontGrey),
                    prefixIcon: Image.asset(AppImages.meta),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                ...List.generate(
                  10,
                  (index) => ChatItem(),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.buttonGreen,
          onPressed: () {},
          child: Image.asset(AppImages.newChat),
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(AppImages.profile),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Creative Minds V1',
            style: AppTextStyles.s16W600.copyWith(color: AppColors.whiteColor),
          ),
          Text(
            '12.10 pm',
            style: AppTextStyles.s12W400.copyWith(color: AppColors.fontGrey),
          ),
        ],
      ),
      subtitle: Text(
        'Design Chat 2 is now avtive',
        style: AppTextStyles.s14W500.copyWith(color: AppColors.fontGrey),
      ),
    );
  }
}

class AppImages {
  static const String appBarImage = 'assets/images/app_bar.png';
  static const String qrCode = 'assets/images/qr_code.png';
  static const String camera = 'assets/images/camera.png';
  static const String menu = 'assets/images/menu.png';
  static const String meta = 'assets/images/meta.png';
  static const String profile = 'assets/images/profile.png';
  static const String newChat = 'assets/images/new_chat.png';
}

class AppTextStyles {
  static TextStyle get s20W600White => TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.whiteColor);
  static TextStyle get s15W500 => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get s12W400 => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get s14W500 => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get s16W600 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
}

class AppColors {
  static Color backGroundColor = Color(0xFF091014);
  static Color whiteColor = Color(0xFFDAE0E1);
  static Color fieldColor = Color(0xFF21282C);
  static Color fontGrey = Color(0xFF9A9A9A);
  static Color buttonGreen = Color(0xFF00C357);
}
