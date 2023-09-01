[![pub package version](https://img.shields.io/pub/v/date_format_field)](https://pub.dev/packages/date_format_field)
[![license](https://img.shields.io/github/license/AnthonyAniobi/Date_Format_Field)](https://github.com/AnthonyAniobi/Date_Format_Field)
[![issues](https://img.shields.io/github/issues/AnthonyAniobi/Date_Format_Field)](https://github.com/AnthonyAniobi/Date_Format_Field)

<!-- [![forks](https://img.shields.io/github/forks/AnthonyAniobi/Date_Format_Field)](https://github.com/AnthonyAniobi/Date_Format_Field)
[![stars](https://img.shields.io/github/stars/AnthonyAniobi/Date_Format_Field)](https://github.com/AnthonyAniobi/Date_Format_Field) -->

A Textfield supporting automatic date formating.

## Features

This textfield supports four date time formating options:

- Four Date formating styles
- Automatic addition of separators
- Two Spearators for time formating
- Sets Keboard type to date keyboard

## Getting Started

In your flutter project `pubspec.yaml` add the dependency

```yaml
dependencies:
  date_time_formater: any
```

Inport the package to your file

```dart
import 'package:date_format_field/date_format_field.dart';
```

Create a Simple DateTime field

```dart
DateFormatField(
    type: DateFormatType.type1,
    onComplete: (date){
        print(date.toString)
    }
)
```

## Usage

### Format Options

`DateFormatField` takes in a required `type` this gives a date formating option for the textfield. The available types are:

| type    | example    | description                                                                                                                                             |
| ------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `type1` | 23/10/22   | This format gives the last two values of the year. this type assumes the 21st century for all entries. It uses a backslash (`/`) for seperation of date |
| `type2` | 23/10/2022 | This format uses a backslash (`/`) for separation and gives the date in full                                                                            |
| `type3` | 23-10-22   | This format gives the last two digits of the year and uses a dash (`-`) for separation. It assumes the 21st century for all entries                     |
| `type4` | 23-10-2022 | This format gives the year in full and uses a dash (`-`) for separation                                                                                 |

**Preview**

Type 1

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/type1_formater.gif?raw=true" width="350px">

Type 2

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/type2_formater.gif?raw=true" width="350px">

Type 3

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/type3_formater.gif?raw=true" width="350px">

Type 4

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/type4_formater.gif?raw=true" width="350px">

_basic example using type 4_

```dart
DateFormatField(
    type: DateFormatType.type4,
    onComplete: (date){
        print(date.toString)
    }
)
```

### Getting data

The `onComplete` call back function returns a `Datetime` nullable object containing the result from the `DateFormatField`.

The response from the call back returns null when ever the field is not complete but when the entry for the date input is complete, it returns true.

You can use a null check to update your value once the entry is complete. See the example below

```dart
DateFormatField(
    type: DateFormatType.type1,
    onComplete: (date){
        if(date != null){
            setState((){
                selectedDate = date!;
            });
        }
    }
)
```

### removing calendar Icon

By default a calendar icon is attached as the trailling icon which triggers a `Date Selection` modal screen on clicking.

Calendar Icon on `DateFormatField`

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/textfield_calendar.png?raw=true" width="350px">

Modal on clicking calendar Icon

<img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/date_selection.png?raw=true" width="350px">

Selecting a date prefills the DateFormatField using the selected date.

You can remove this icon by setting the `addCalendar` to `false`. this is shown in the example below:

```dart
DateFormatField(
    type: DateFormatType.type4,
    addCalendar: false,
    onComplete: (date) {
        print(date);
    },
),
```

### Adding Decoration to DateFormatField

`DateFormatField` makes use of the default `InputDecoration` class which comes with Flutter `TextField`s. This allows you to style the textfield widget as much as you like. The example below shows this usage:

```dart
import 'package:date_format_field/date_format_field.dart';

DateFormatField(
    type: DateFormatType.type4,
    decoration: const InputDecoration(
        labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontStyle: FontStyle.italic,
        ),
        border: InputBorder.none,
        label: Text("Date"),
    ),
    onComplete: (date) {
        setState(() {
        _date = date;
        });
    },
),
```

<!-- <img src="https://github.com/AnthonyAniobi/Date_Format_Field/blob/main/screenshots/bmc_logo.png?raw=true" width="350px"> -->

## Support the package

Have a feature you would like to see? why not lend the developers a hand 🤝

<a href="https://www.buymeacoffee.com/aniobi"><img src="screenshots/bmc_logo.png" height="70px"></a>
