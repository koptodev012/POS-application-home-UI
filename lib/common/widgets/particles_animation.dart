import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:home_design/common/variables.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';

class ParticleAnimation extends StatefulWidget {
  const ParticleAnimation({super.key});

  @override
  State<ParticleAnimation> createState() => _ParticleAnimationState();
}

class _ParticleAnimationState extends State<ParticleAnimation> {
  // ! -----------------------------------------------------------
  List<Particle> createParticles() {
    var rng = Random();
    List<Particle> particles = [];
    for (int i = 0; i < 140; i++) {
      particles.add(Particle(
        color: CommonVariables.isDarkMode == false
            ? CommonColors.homeContainerBg
            : CommonColors.darkModeColorSecondary,
        size: rng.nextDouble() * 10,
        velocity: Offset(rng.nextDouble() * 200 * randomSign(),
            rng.nextDouble() * 200 * randomSign()),
      ));
    }
    return particles;
  }

  double randomSign() {
    var rng = Random();
    return rng.nextBool() ? 1 : -1;
  }
  // ! -----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Particles(
      awayRadius: 150,
      particles: createParticles(),
      height: DeviceUtils.getDeviceDimension(context).height,
      width: DeviceUtils.getDeviceDimension(context).width,
      onTapAnimation: true,
      awayAnimationDuration: const Duration(milliseconds: 800),
      awayAnimationCurve: Curves.linear,
      enableHover: true,
      hoverRadius: 90,
      connectDots: false,
    );
  }
}
