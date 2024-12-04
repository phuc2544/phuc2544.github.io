class Pageviewthongbao {
  late String avtImage;
  late String title;
  late String content;

  Pageviewthongbao(
      {required this.title, required this.content, this.avtImage = ""});
}

var listPageviewthongbao = [
  Pageviewthongbao(
      title: "Khuyến mãi",
      content: "Deal giảm đến 50% thêm mã 50K Cùng ưu đãi MUA 1 TẶNG 1 ",
      avtImage:
          "https://plus.unsplash.com/premium_photo-1667030474693-6d0632f97029?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Pageviewthongbao(
      title: "Nhắc nhở: Bạn đã nhận được hàng chưa",
      content:
          "Nếu bạn chưa nhận được hàng hoặc gặp vấn đề với đơn hàng, hãy nhấn Trả hàng/Hoàn tiền trước ngày 10-11-2024",
      avtImage:
          "https://images.unsplash.com/photo-1550853024-fae8cd4be47f?q=80&w=1788&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
];