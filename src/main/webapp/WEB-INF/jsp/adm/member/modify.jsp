<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sbs.untactTeacher.util.Util"%>

<%@ include file="../part/mainLayoutHead.jspf"%>

<script>
	MemberModify__submited = false;
	function MemberModify__checkAndSubmit(form) {
		if (MemberModify__submited) {
			alert('처리중입니다.');
			return;
		}

		if (MemberModify__submited) {
			return;
		}

		if (form.loginPw.value) {
			form.loginPw.value = form.loginPw.value.trim();

			if (form.loginPw.value.length == 0) {
				alert('로그인비번을 입력해주세요.');
				form.loginPw.focus();

				return;
			}

			if (form.loginPwConfirm.value.length == 0) {
				alert('로그인비번 확인을 입력해주세요.');
				form.loginPwConfirm.focus();

				return;
			}

			if (form.loginPw.value != form.loginPwConfirm.value) {
				alert('로그인비번이 일치하지 않습니다.');
				form.loginPwConfirm.focus();

				return;
			}
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.');
			form.name.focus();

			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			alert('별명을 입력해주세요.');
			form.nickname.focus();

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요.');
			form.email.focus();

			return;
		}

		form.cellphoneNo.value = form.cellphoneNo.value.trim();

		if (form.cellphoneNo.value.length == 0) {
			alert('휴대전화번호를 입력해주세요.');
			form.cellphoneNo.focus();

			return;
		}

		form.submit();
		MemberModify__submited = true;
	}
</script>

<section class="section-1">
	<div class="bg-white shadow-md rounded container mx-auto p-8 mt-8">
		<form onsubmit="MemberModify__checkAndSubmit(this); return false;"
			action="doModify" method="POST">
			<input type="hidden" name="id" value="${member.id}" />
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>로그인아이디</span>
				</div>
				<div class="lg:flex-grow">${member.loginId}</div>
			</div>
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>로그인비번</span>
				</div>
				<div class="lg:flex-grow">
					<input type="password" name="loginPw" autofocus="autofocus"
						class="form-row-input w-full rounded-sm" placeholder="로그인비밀번호를 입력해주세요." />						
				</div>
			</div>
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>로그인비번 확인</span>
				</div>
				<div class="lg:flex-grow">
					<input type="password" name="loginPwConfirm" autofocus="autofocus"
						class="form-row-input w-full rounded-sm" placeholder="로그인비밀번호 확인을 입력해주세요." />						
				</div>
			</div>
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>이름</span>
				</div>
				<div class="lg:flex-grow">
					<input value="${member.name}" type="text" name="name" autofocus="autofocus"
						class="form-row-input w-full rounded-sm" placeholder="이름을 입력해주세요." />						
				</div>
			</div>
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>별명</span>
				</div>
				<div class="lg:flex-grow">
					<input value="${member.nickname}" type="text" name="nickname" autofocus="autofocus"
						class="form-row-input w-full rounded-sm" placeholder="별명을 입력해주세요." />						
				</div>
			</div>
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>이메일</span>
				</div>
				<div class="lg:flex-grow">
					<input value="${member.email}" type="email" name="email" autofocus="autofocus"
						class="form-row-input w-full rounded-sm" placeholder="이메일을 입력해주세요." />						
				</div>
			</div>
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>전화번호</span>
				</div>
				<div class="lg:flex-grow">
					<input value="${member.cellphoneNo}" type="text" name="cellphoneNo" autofocus="autofocus"
						class="form-row-input w-full rounded-sm" placeholder="전화번호를 입력해주세요." />						
				</div>
			</div>
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>권한레벨</span>
				</div>
				<div class="lg:flex-grow">
					<select class="form-row-input w-full rounded-sm select-auth-level">
						<option value="3">일반회원</option>
						<option value="7">관리자</option>
					</select>
					<script>
					const memberAuthLevel = parseInt("${member.authLevel}");
					</script>
					<script>
						$('.section-1 .select-auth-level').val(memberAuthLevel);
					</script>						
				</div>
			</div>
			<div class="form-row flex flex-col lg:flex-row">
				<div class="lg:flex lg:items-center lg:w-28">
					<span>수정</span>
				</div>
				<div class="lg:flex-grow">
					<div class="btns">
						<input type="submit"
							class="btn-primary bg-blue-500 hover:bg-blue-dark text-white font-bold py-2 px-4 rounded"
							value="수정">
						<input onclick="history.back();" type="button"
							class="btn-info bg-red-500 hover:bg-red-dark text-white font-bold py-2 px-4 rounded"
							value="취소">
					</div>
				</div>
			</div>
		</form>
	</div>
</section>

<%@ include file="../part/mainLayoutFoot.jspf"%>