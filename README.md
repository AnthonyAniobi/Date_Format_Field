<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
<!-- [![pub package version](https://img.shields.io/pub/v/persistent_bottom_nav_bar)](https://pub.dev/packages/persistent_bottom_nav_bar) -->
[![issues](https://img.shields.io/github/issues/AnthonyAniobi/Date_Format_Field)](https://github.com/AnthonyAniobi/Date_Format_Field)
[![forks](https://img.shields.io/github/forks/AnthonyAniobi/Date_Format_Field)](https://github.com/AnthonyAniobi/Date_Format_Field)
[![stars](https://img.shields.io/github/stars/AnthonyAniobi/Date_Format_Field)](https://github.com/AnthonyAniobi/Date_Format_Field)
[![license](https://img.shields.io/github/license/AnthonyAniobi/Date_Format_Field)](https://github.com/AnthonyAniobi/Date_Format_Field)


A Textfield supporting automatic date formating. 


## Styles

Type 1

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/type1_formater.gif?raw=true" width="350px">

Type 2

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/type2_formater.gif?raw=true" width="350px">

Type 3

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/type3_formater.gif?raw=true" width="350px">

Type 4

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/type4_formater.gif?raw=true" width="350px">



## Features
This textfield supports four date time formating options:

- Four Date formating styles
- Automatic addition of separators
- Two Spearators for time formating
- Sets Keboard type to date keyboard


## Getting Started

In your flutter project `pubspec.yaml` add the dependency
```
dependencies:
  date_time_formater: any
```


## Usage

1. Install the package by adding the following in your `pubspec.yaml` file
```
date_time_formater: latest_version
```
2. Add this field to your widget screen using 
```
import 'package:date_format_field/date_format_field.dart';

DateFormatField(
    type: DateFormatType.type4,
)
```

*Add Styling* 

The widget makes use of `InputDecorator` which is the same as the default styling supported by flutter

example:

```
DateFormatField(
    type: DateFormatType.type4,
    decoration: InputDecoration(
        hintText: 'DD/MM/YY',
        border: InputBorder.none,
        icon: Icon(Icons.calendar_month)
    ),
)
```

