<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>头像修改</title>
</head>
<body>
<div class="modal fade edit-email-modal" tabindex="-1" role="dialog" aria-labelledby="editEmailModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="editEmailModalLabel">修改邮箱</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="oldEmail" class="control-label">旧邮箱:</label>
                        <input type="email" class="form-control" id="oldEmail" value="${sessionScope.user.email}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="newEmail" class="control-label">新邮箱:</label>
                        <input type="email" class="form-control" id="newEmail">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary save-email-btn">保存</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('.edit-email-btn').click(function() {
            $('.edit-email-modal').modal('show');
        });

        $('.save-email-btn').click(function() {
            var newEmail = $('#newEmail').val();
            $.ajax({
                url: '/change-email',
                method: 'POST',
                data: {email: newEmail},
                headers: { "X-Requested-With": "XMLHttpRequest", "Accept": "application/json" },
                success: function(response) {
                    if (response.code === 100) {
                        alert('邮箱已更新');
                        $('.edit-email-modal').modal('hide');
                        // 更新页面显示的邮箱
                        $('.user-email').text(response.extendInfo.newEmail);
                        location.reload();
                    } else {
                        alert('更新失败：' + response.extendInfo.error);
                    }
                },
                error: function(xhr, status, error) {
                    alert('发生错误：' + xhr.responseText);
                }
            });
        });

    });
</script>
</body>
</html>
