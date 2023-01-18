const joinForm = document.joinForm;

function sendit() {
    const uid = joinForm.userid;
    if (uid.value == "") {
        swal({
            text: "���̵� �Է��ϼ���.",
            closeOnClickOutside: false
        }).then(function () {
            uid.focus();
        });
        return false;
    }
    const upw = joinForm.pwd;
    if (upw.value == "") {
        swal({
            text: "��й�ȣ�� �Է��ϼ���.",
            closeOnClickOutside: false
        }).then(function () {
            upw.focus();
        });
        return false;
    }
    if (upw.value.length < 6) {
        swal({
            text: "��й�ȣ�� 6���� �̻��̾�� �մϴ�.",
            closeOnClickOutside: false
        }).then(function () {
            upw.focus();
        });
        return false;
    }
    const upwCheck = joinForm.userpwd;
    if (upwCheck.value == "") {
        swal({
            text: "��й�ȣ�� Ȯ�����ּ���.",
            closeOnClickOutside: false
        }).then(function () {
            upwCheck.focus();
        });
        return false;
    }
    if (upw.value != upwCheck.value) {
        swal({
            text: "��й�ȣ�� ��ġ���� �ʽ��ϴ�.",
            closeOnClickOutside: false
        }).then(function () {
            upw.focus();
        });
        return false;
    }
    const uname = joinForm.username;
    if (uname.value == "") {
        swal({
            text: "�̸��� �Է��ϼ���.",
            closeOnClickOutside: false
        }).then(function () {
            uname.focus();
        });
        return false;
    }
}