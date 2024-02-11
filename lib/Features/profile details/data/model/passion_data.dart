import 'package:dating/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List listOfInterests = [
  (
    'Photography',
    const Icon(
      Icons.camera_alt_outlined,
      color: kPrimaryClr,
    )
  ),
  (
    'Shopping',
    const Icon(
      Icons.shopping_bag_outlined,
      color: kPrimaryClr,
    )
  ),
  (
    'Karaoke',
    const Icon(
      Icons.mic_none_outlined,
      color: kPrimaryClr,
    )
  ),
  ('Yoga', SvgPicture.asset('assets/images/yoga.svg')),
  ('Cooking', SvgPicture.asset('assets/images/cooking.svg')),
  (
    'Tennis',
    const Icon(
      Icons.sports_tennis_outlined,
      color: kPrimaryClr,
    )
  ),
  (
    'Run',
    const Icon(
      Icons.directions_run_outlined,
      color: kPrimaryClr,
    )
  ),
  (
    'Swimming',
    const Icon(
      Icons.water_outlined,
      color: kPrimaryClr,
    )
  ),
  ('Art', SvgPicture.asset('assets/images/art.svg')),
  (
    'Traveling',
    const Icon(
      Icons.travel_explore_outlined,
      color: kPrimaryClr,
    )
  ),
  (
    'Extreme',
    const Icon(
      Icons.paragliding_outlined,
      color: kPrimaryClr,
    )
  ),
  ('Music', SvgPicture.asset('assets/images/music.svg')),
  ('Drink', SvgPicture.asset('assets/images/drink.svg')),
  ('Video Games', SvgPicture.asset('assets/images/video_games.svg')),
];
