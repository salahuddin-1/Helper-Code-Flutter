
// Note: in TweenAnimationBuilder in tween parameter, the Tween is 
// type defined i.e. it can accept anything Color, int, double
// If color then you have to define the begin Color and the end Color
// Here we are animating double

TweenAnimationBuilder<double>(
  
  // Begin the animation at "-100" and end the animation at "0"
  // But what are these values ?
      tween: Tween<double>(begin: -100, end: 0),
  
  // The duration on which animation should last
      duration: const Duration(seconds: 5),
      builder: (BuildContext context, double value, Widget? child) {
        // The value will start from "-100" and end at "0"
        // And with this value in mind we'll show the rendering process
        // i.e. the animation

        return Transform.translate(
          // The value will begin from -100, -99, -98 ......... and it will end at 0
          // So the Offset(dx, dy), dx wil be -100, then -99, then -98
          // and will continue to do so till it reaches 0
          // These start and end value we have defined in tween parameter
          // The dy is set to 0 bcoz we won't animate that
          offset: Offset(value, 0),
          
          // The child obtained here is the Image.asset() that we provided in the 
          // TweenAnimationBuilder's child
          child: child,
        );
      },

  // The image we want to animate
      child: Image.asset(
        AssetUtils.mascot,
        height: 320,
        width: 320,
      ),
    )


