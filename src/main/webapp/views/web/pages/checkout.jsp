<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<!DOCTYPE html>
<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Thanh toán</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
        <li class="breadcrumb-item"><a href="#">Dịch vụ</a></li>
        <li class="breadcrumb-item active text-white">Thanh toán</li>
    </ol>
</div>
<!-- Single Page Header End -->

<!-- Checkout Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <h1 class="mb-4">Đơn hàng</h1>
        <c:if test="${not empty alert}">
	    	<div class="alert alert-${alert}">
			  <strong>${message}</strong>
			</div>
		</c:if>
        <form action="<c:url value='/checkout'/>" method="POST">
            <div class="row g-5">
                <div class="col-md-12 col-lg-6 col-xl-7">
                    <div class="form-item">
                        <label class="form-label my-3">Họ và tên<sup>*</sup></label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Họ và tên" value="">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">Địa chỉ nhận hàng <sup>*</sup></label>
                        <input type="text" class="form-control" id="shippingAddress" name="shippingAddress" placeholder="Địa chỉ người nhận" value="">
                    </div>
                    <div class="form-item">
                        <label class="form-label my-3">Số điện thoại<sup>*</sup></label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Số điện thoại" value="">
                    </div>
                    <hr>
                    <div class="form-item">
                        <textarea name="text" class="form-control" spellcheck="false" cols="30" rows="11" placeholder="Lưu ý đơn hàng"></textarea>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 col-xl-5">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Sản phẩm</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Tổng</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="entry" items="${CART}">
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center mt-2">
                                            <img src="${entry.value.product.thumbnail}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                        </div>
                                    </th>
                                    <td class="py-5">${entry.value.product.title}</td>
                                    <td class="py-5"><fmt:formatNumber value="${entry.value.product.price}"/><sup>đ</sup></td>
                                    <td class="py-5">${entry.value.quantity}</td>
                                    <td class="py-5"><fmt:formatNumber value="${entry.value.totalPrice}"/><sup>đ</sup></td>
                                </tr>
                                </c:forEach>
                                <tr>
                                    <th scope="row">
                                    </th>
                                    <td class="py-5">
                                        <p class="mb-0 text-dark py-3">Phí giao hàng</p>
                                    </td>
                                    <td class="py-5"></td>
                                    <td class="py-5"></td>
                                    <td class="py-5">
                                        <div class="py-3 border-bottom border-top">
                                            <p class="mb-0 text-dark"><fmt:formatNumber value="${SHIPPING}"/><sup>đ</sup></p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                    </th>
                                    <td class="py-5">
                                        <p class="mb-0 text-dark text-uppercase py-3">TỔNG</p>
                                    </td>
                                    <td class="py-5"></td>
                                    <td class="py-5"></td>
                                    <td class="py-5">
                                        <div class="py-3 border-bottom border-top">
                                            <p class="mb-0 text-dark"><fmt:formatNumber value="${TOTALBILL + SHIPPING}"/><sup>đ</sup></p>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                        <div class="col-12">
                            <div class="form-check text-start my-3">
                                <input type="checkbox" class="form-check-input bg-primary border-0" id="status" name="status" value="Đã thanh toán" >
                                <label class="form-check-label" for="Transfer-1">Thanh toán trước khi nhận hàng</label>
                            </div>
                            <p class="text-start text-dark">Thực hiện thanh toán trực tiếp vào tài khoản ngân hàng của chúng tôi. Vui lòng sử dụng ID đơn hàng của bạn làm tài liệu tham khảo thanh toán.</p>
                        </div>
                    </div>
                    <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                        <div class="col-12">
                            <div class="form-check text-start my-3">
                                <input type="checkbox" class="form-check-input bg-primary border-0" id="status" name="status" value="Thanh toán khi nhân hàng">
                                <label class="form-check-label" for="Delivery-1">Thanh toán khi nhận hàng</label>
                            </div>
                        </div>
                    </div>
                    <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                        <button type="submit" id="btnCheckout" name="btnCheckout" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Đặt hàng</button>
                    </div>
                </div>
            </div>
            <input type="hidden" id="totalPrice" name="totalPrice" value="${TOTALBILL + SHIPPING}">
        </form>
    </div>
</div>
<!-- Checkout Page End -->