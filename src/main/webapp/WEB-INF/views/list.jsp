<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<c:url value="/add" var="addUrl" />

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-4 .col-lg-2">

				<div>

					<div class="d-flex justify-content-between">
						<h3>목록</h3>

						<a href="${addUrl }" class="btn btn-primary"><i
							class="fa-solid fa-plus"></i></a>
					</div>
					<div class="mt-3">
						<c:forEach items="${list }" var="item" varStatus="status">
							<div class="card">
								<div id="${status.index }" class="card-body name-item">

									${item }</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 삭제 폼 -->
	<c:url value="/delete" var="deleteUrl" />
	<form action="${deleteUrl }" method="post" id="deleteForm">
		<input type="hidden" name="index" id="input3" /> 
	</form>

	<!-- 모달 -->
	<div class="modal fade" id="updateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<c:url value="/update" var="updateUrl" />
					<form action="${updateUrl }" method="post" id="updateForm">
						<input type="hidden" id="input1" name="index" />
						<input class="form-control" type="text" name="name" id="input2" />
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<input type="submit" class="btn btn-primary" form="updateForm" value="수정" />
					<input type="submit" class="btn btn-danger" form="deleteForm" value="삭제" />
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>
		const myModal = new bootstrap.Modal("#updateModal");

		$(".name-item").click(function() {
			const name = $(this).text().trim();
			const index = $(this).attr("id");

			$("#input1").val(index);
			$("#input2").val(name);
			$("#input3").val(index);

			myModal.show();
		});
	</script>
</body>
</html>