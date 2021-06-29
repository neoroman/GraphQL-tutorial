// Util.js
function convertUTCDateToLocalDate(date, toUTC) {
    // Thanks to https://stackoverflow.com/a/23423512
    date = new Date(date);
    //Local time converted to UTC
    var localOffset = date.getTimezoneOffset() * 60000;
    var localTime = date.getTime();
    if (toUTC) {
        date = localTime + localOffset;
    } else {
        date = localTime - localOffset;
    }
    date = new Date(date);
    return date;
}
function to_date(date_str)
{
    var yyyyMMdd = String(date_str);
    var sYear = yyyyMMdd.substring(0,4);
    var sMonth = yyyyMMdd.substring(4,6);
    var sDate = yyyyMMdd.substring(6,8);

    return new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
}
function get_date_str(date)
{
    date = new Date(date);
    var sYear = date.getFullYear();
    var sMonth = date.getMonth() + 1;
    var sDate = date.getDate();

    sMonth = sMonth > 9 ? sMonth : "0" + sMonth;
    sDate  = sDate > 9 ? sDate : "0" + sDate;
    return `${sYear}${sMonth}${sDate}`;
}
function first_day(date_str)
{
    var yyyyMMdd = String(date_str);
    var days = "01";
    var year = yyyyMMdd.substring(0,4);
    var month = yyyyMMdd.substring(4,6);
    return year+month+days;
}
function last_day(date_str)
{
    var yyyyMMdd = String(date_str);
    var days = "31";
    var year = yyyyMMdd.substring(0,4);
    var month = yyyyMMdd.substring(4,6);

    if (Number(month) == 2) {
        if (is_leap_year(year+month+"01"))
            days = "29";
        else
            days = "28";
    } else if (Number(month) == 4 || Number(month) == 6 || Number(month) == 9 || Number(month) == 11) {
        days = "30";
    }

    return year+month+days;
}
function get_monday(date_str) {
    // Thanks to https://stackoverflow.com/a/5210450
    var curr = to_date(date_str); // get current date
    var first = curr.getDate() - curr.getDay() + 1; // Monday is the day of the month - the day of the week + 1

    return convertUTCDateToLocalDate(new Date(curr.setDate(first)));
}
function get_friday(date_str) {
    // Thanks to https://stackoverflow.com/a/5210450
    var curr = to_date(date_str); // get current date
    var first = curr.getDate() - curr.getDay() + 1; // Monday is the day of the month - the day of the week + 1
    var last = first + 4; // Friday is the Monday + 4

    return convertUTCDateToLocalDate(new Date(curr.setDate(last)));
}
function daysInMonth(year, month) {
    // Thanks to https://stackoverflow.com/a/7828133
    return 32 - new Date(year, month, 32).getDate();
}
function isWeekday(year, month, day) {
    // Thanks to https://stackoverflow.com/a/7828133
    var day = new Date(year, month, day).getDay();
    return day !=0 && day !=6;
}
function getWeekdaysInWeek(date_str) {
    var monday = get_monday(date_str);
    var yyyyMMdd = String(get_date_str(monday));
    console.log("Monday =>", yyyyMMdd);
    var year = Number(yyyyMMdd.substring(0,4));
    var month = Number(yyyyMMdd.substring(4,6)) - 1;
    var day = Number(yyyyMMdd.substring(6,8));

    var weekdayList = [];
    for(var i=0; i< 5; i++) {
        if (isWeekday(year, month, day+i)) {
            const tmp = get_date_str(new Date(year, month, day+i));
            console.log("Days =>", tmp);
            weekdayList.push(tmp);
        }
    }
    return weekdayList;
}
function getWeekdaysInMonth(date_str) {
    // Thanks to https://stackoverflow.com/a/7828133
    var yyyyMMdd = String(date_str);
    var year = Number(yyyyMMdd.substring(0,4));
    var month = Number(yyyyMMdd.substring(4,6)) - 1;

    var days = daysInMonth(year, month);
    var weekdayList = [];
    for(var i=0; i< days; i++) {
        if (isWeekday(year, month, i+1)) {
            weekdayList.push(get_date_str(new Date(year, month, i+1)))
        }
    }
    return weekdayList;
}
exports.convertUTCDateToLocalDate = convertUTCDateToLocalDate;
exports.to_date = to_date;
exports.get_date_str = get_date_str;
exports.first_day = first_day;
exports.last_day = last_day;
exports.get_monday = get_monday;
exports.get_friday = get_friday;
exports.getWeekdaysInWeek = getWeekdaysInWeek;
exports.getWeekdaysInMonth = getWeekdaysInMonth;