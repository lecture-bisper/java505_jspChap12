<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-27
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>파일 사용하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
          crossorigin="anonymous"></script>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");

  String fileUploadPath = "C:\\java505\\upload";

  DiskFileUpload upload = new DiskFileUpload();
  List items = upload.parseRequest(request);
//  반복 가능한 객체로 생성
  Iterator params = items.iterator();

//  hasNext() : 다음 데이터가 존재하는지 확인
  while (params.hasNext()) {
//    next() : 다음 데이터를 가져옴
    FileItem fileItem = (FileItem) params.next();

    if (!fileItem.isFormField()) {
      String fileName = fileItem.getName();
      fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
      File file = new File(fileUploadPath + "/" + fileName);
//      실제 파일 저장
      fileItem.write(file);
    }
  }
%>
</body>
</html>






