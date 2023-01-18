// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_it/product/constants/prduct_image_enum.dart';
import 'package:shop_it/product/constants/project_padding.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: ProjectPadding.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileInfoWidget(context),
            const _ProfileColumnWidget(textOne: 'General', textTwo: 'Edit Profile'),
            const _ProfileColumnWidget(textTwo: 'Notification'),
            const _ProfileColumnWidget(textTwo: 'Wishlist'),
            const _ProfileColumnWidget(textOne: 'Legal', textTwo: 'Terms of Use'),
            const _ProfileColumnWidget(textTwo: 'Privacy Policy'),
            const _ProfileColumnWidget(textOne: 'Personal', textTwo: 'Report a Bug'),
            const _ProfileColumnWidget(textTwo: 'Logout'),
          ],
        ),
      ),
    );
  }

  Row _profileInfoWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ProjectImageEnum.profileAvatar.image(width: 80),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text('Jogn@gmail.com', style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey.shade600)),
          ],
        )
      ],
    );
  }
}

class _ProfileColumnWidget extends StatelessWidget {
  final String? textOne;
  final String? textTwo;
  const _ProfileColumnWidget({
    Key? key,
    // ignore: unused_element
    this.textOne,
    // ignore: unused_element
    this.textTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.categoyPadding,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Divider(
            color: Theme.of(context).shadowColor.withOpacity(0.3),
            thickness: 1.1,
          ),
          Text(textOne ?? '', style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey.shade600)),
          textOne != null ? const SizedBox(height: 30) : const SizedBox.shrink(),
          Text(textTwo ?? '', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
