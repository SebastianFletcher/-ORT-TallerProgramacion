function changeContainer(pageName) {
    if (pageName == "mainPage")
        $("#divInfoMainPage").removeAttr('hidden');
    else
        $("#divInfoMainPage").attr('hidden', '');

    if (pageName == "addInstructor")
        $("#divRegisterInstructor").removeAttr('hidden');
    else
        $("#divRegisterInstructor").attr('hidden', '');

    if (pageName == "approveClient")
        $("#divApproveClient").removeAttr('hidden');
    else
        $("#divApproveClient").attr('hidden', '');

    if (pageName == "confirmDrivingLicense")
        $("#divConfirmDrivingLic").removeAttr('hidden');
    else
        $("#divConfirmDrivingLic").attr('hidden', '');

    if (pageName == "classList")
        $("#divClassList").removeAttr('hidden');
    else
        $("#divClassList").attr('hidden', '');

    if (pageName == "bookClass")
        $("#divBookClass").removeAttr('hidden');
    else
        $("#divBookClass").attr('hidden', '');
}
