<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../part/mainLayoutHead.jspf"%>

<section class="section-1">
	<div class="bg-white shadow-md rounded container mx-auto p-8 mt-8">
		<div class="flex">
			<select class="py-2 select-auth-level">
				<option value="">권한전체</option>
				<option value="3">일반회원</option>
				<option value="7">관리자</option>
			</select>
			<script>
				if ( !param.authLevel ) {
					param.authLevel = '';
				}
				
				$('.section-1 .select-auth-level').val(param.authLevel);

				$('.section-1 .select-auth-level').change(function() {
					location.href = '?authLevel=' + this.value;
				});
			</script>
		</div>
		<div>
			<c:forEach items="${members}" var="member">
				<c:set var="detailUrl" value="detail?id=${member.id}" />
				<div class="flex items-center mt-10">
					<a href="${detailUrl}" class="font-bold">NO. ${member.id}</a>
					<a href="${detailUrl}" class="ml-2 font-light text-gray-600">${member.regDate}</a>
					<div class="flex-grow"></div>
					<a href="?authLevel=${member.authLevel}" class="cursor-pointer px-2 py-1 bg-${member.authLevelNameColor}-600 text-${member.authLevelNameColor}-100 font-bold rounded hover:bg-${member.authLevelNameColor}-500">${member.authLevelName}</a>
				</div>
				<div class="mt-2">
					<a href="${detailUrl}" class="mt-2 text-gray-600 block">
						<span class="inline-flex justify-center items-center px-2 rounded-full bg-green-500 text-white">로그인 아이디</span>
						<span>${member.loginId}</span>
					</a>
					<a href="${detailUrl}" class="mt-2 text-gray-600 block">
						<span class="inline-flex justify-center items-center px-2 rounded-full bg-green-500 text-white">이름</span>
						<span>${member.name}</span>
					</a>
					<a href="${detailUrl}" class="mt-2 text-gray-600 block">
						<span class="inline-flex justify-center items-center px-2 rounded-full bg-green-500 text-white">로그인 아이디</span>
						<span>${member.nickname}</span>
					</a>
				</div>
				<div class="flex items-center mt-4">
					<a href="detail?id=${member.id}" class="text-blue-500 hover:underline" title="자세히 보기">
						<span>
							<i class="fas fa-info"></i>
							<span class="hidden sm:inline">자세히 보기</span>
						</span>
					</a>
					<a href="modify?id=${member.id}" class="ml-2 text-blue-500 hover:underline">
						<span>
							<i class="fas fa-edit"></i>
							<span class="hidden sm:inline">수정</span>
						</span>
					</a>
					<a onclick="if ( !confirm('삭제하시겠습니까?') ) return false;" href="doDelete?id=${member.id}" class="ml-2 text-blue-500 hover:underline">
						<span>
							<i class="fas fa-trash"></i>
							<span class="hidden sm:inline">삭제</span>
						</span>
					</a>
					<div class="flex-grow"></div>
					<div>
						<a class="flex items-center">
							<img
								src="https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=731&amp;q=80"
								alt="avatar" class="mx-4 w-10 h-10 object-cover rounded-full">
							<h1 class="text-gray-700 font-bold hover:underline">${member.nickname}</h1>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<%@ include file="../part/mainLayoutFoot.jspf"%>