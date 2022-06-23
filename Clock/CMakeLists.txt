cmake_minimum_required(VERSION 3.16)

project(Clock VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appClock
    main.cpp
)

qt_add_qml_module(appClock
    URI Clock
    VERSION 1.0
    QML_FILES main.qml Head.qml Back.qml SetButton.qml
        Button.qml AnalogClock.qml DigitalClock.qml DateTxt.qml Clock.qml
        AlarmDateButton.qml AlarmAnalogClock.qml AlarmHourSet.qml AlarmList.qml
)

qt_add_resources(appClock "assets"
    PREFIX "/"
    FILES assets/alarm-off-feedback.svg assets/alarm-on-feedback.svg assets/btn-arrow-active.svg
        assets/btn-arrow-hover.svg assets/btn-back-active.svg assets/btn-pause-active.svg
        assets/btn-pause-hover.svg assets/btn-play-active.svg assets/btn-play-hover.svg
        assets/btn-reload-active.svg assets/btn-reload-hover.svg assets/check_disabled.svg
        assets/check_selected.svg assets/comp-clock-dial.svg assets/comp-slider.svg
        assets/comp_tic-tac.svg assets/comp_tic-tac_alarm_mode.svg assets/handle-enable.svg
        assets/handle-pressed.svg assets/ic-clock-hand-alarm.svg assets/ic-clock-hand_hours.svg
        assets/ic-clock-hand_mins.svg assets/ic-clock-hands_center.svg assets/ic-hour-handle.svg
        assets/ic-mins-handle.svg assets/ic-tick-disabled.svg assets/ic-tick-hover.svg
        assets/ic-tick-selected.svg assets/switch-off-disable.svg assets/switch-off-selected.svg
        assets/switch-on-disable.svg assets/switch-on-disable2.svg assets/switch-on-selected.svg
        assets/comp-clock-dial-setting-alarm-mode.svg assets/timer.svg assets/btn-back-hover.svg
)

set_target_properties(appClock PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appClock
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(appClock
    PRIVATE Qt6::Quick)
