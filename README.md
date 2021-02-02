# HorizonCalendar
A declarative, performant, calendar UI component that supports use cases ranging from simple date pickers all the way up to fully-featured calendar apps.

## Introduction
`HorizonCalendar` is UIKit library for displaying a range of dates in a vertically-scrolling or horizontally-scrolling calendar component. Its declarative API makes updating the calendar straightforward, while also providing many customization points to support a diverse set of designs and use cases.

Features:
- Supports all calendars from `Foundation.Calendar` (Gregorian, Japanese, Hebrew, etc.)
- Display months in a vertically-scrolling or horizontally-scrolling layout
- Declarative API that enables unidirectional data flow for updating the content of the calendar
- A custom layout system that enables virtually infinite date ranges without increasing memory usage
- Specify custom views for individual days, month headers, and days of the week
- Specify custom views to highlight date ranges
- Specify custom views to overlay parts of the calendar, enabling features like tooltips
- A day selection handler to monitor when a day is tapped
- Customizable layout metrics
- Pin the days-of-the-week row to the top
- Show partial boundary months (exactly 2020-03-14 to 2020-04-20, for example)
- Scroll to arbitrary dates and months, with or without animation
- Robust accessibility support
- Inset the content without affecting the scrollable region using `UIView` layout margins
- Separator below the days-of-the-week row
- Right-to-left layout support
