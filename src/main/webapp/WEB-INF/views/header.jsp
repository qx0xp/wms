<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <div id="wrap">
        <header id="header">
            <h1 class="logo"><a href=".">ovolo</a></h1>
            <div class="util">
            	<c:if test="${login!=null}">
	                <p class="log_account">${login.name} 관리자님</p>
	                <p class="log_out"><input type="button" value="logout" onclick="location.href='logout'"></p>
            	</c:if>
            </div>
        </header> <!--#header-->

        <div id="container">
            <nav class="gnb">
                <ul class="ctg">
                    <li>
                        <a href="#">입고관리</a>
                        <ul class="ctg_detail">
                            <li><a href="./receiving_expect">입고예정</a></li>
                            <li><a href="./receiving_status">입고대기</a></li>
                            <li><a href="./receiving_confirm">입고확정현황</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">재고관리</a>
                        <ul class="ctg_detail">
                            <li><a href="./inventory_list">재고조회</a></li>
                            <li><a href="./inventory_move">재고이동</a></li>
                            <li><a href="./inventory_adjust">재고실사</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">출고관리</a>
                        <ul class="ctg_detail">
                            <li><a href="./delivery_expect">출고예정</a></li>
                            <li><a href="./delivery_status">출고대기</a></li>
                            <li><a href="./delivery_confirm">출고확정현황</a></li>
                        </ul>
                    </li>
                    <li><a href="./inventory_history">재고이력</a></li>
                    <li>
                    	<a href="#">입출고현황</a>
                        <ul class="ctg_detail">
                        	<li><a href="./receiving_report">입고현황</a></li>
                        	<li><a href="./delivery_report">출고현황</a></li>
                            <li><a href="./monthly_order">월별입출고건수</a></li>
                        </ul>
                    </li>
                    <li><a href="./raw_admin">원자재관리</a></li>
                    <li><a href="./client_admin">거래처관리</a></li>
                    <li><a href="./join">계정등록</a></li>
                </ul>
            </nav> <!--.gnb-->
            
            
            