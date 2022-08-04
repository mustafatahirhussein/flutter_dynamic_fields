import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEff extends StatefulWidget {
  const ShimmerEff({Key? key}) : super(key: key);

  @override
  State<ShimmerEff> createState() => _ShimmerEffState();
}

class _ShimmerEffState extends State<ShimmerEff> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildEffect(context),
    );
  }

  Widget buildEffect(BuildContext context) {
    return !enabled
        ? buildView(context)
        : Shimmer.fromColors(
            enabled: enabled,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: buildView(context));
  }

  Widget buildView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 33,
      itemBuilder: (_, i) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.99images.com/photos/wallpapers/3d-abstract/abstract-forest%20android-iphone-desktop-hd-backgrounds-wallpapers-1080p-4k-swrhr.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.1,
                    ),
                  ),
                  child: const FlutterLogo(),
                ),
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "1",
                      style: TextStyle(color: Color(0xffffffff)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {},
                      child: const Text("Show more...")),
                ),
              ],
            ),
          ),
          onTap: () => setState(() => enabled = !enabled),
        );
      },
    );
  }
}
