class OnboardingModel {
  final String image;
  final String title;
  final String body;
  OnboardingModel(
      {required this.image, required this.title, required this.body});
}

List<OnboardingModel> pages = [
  OnboardingModel(
      image: 'Assets/on1.svg',
      title: 'ابحث عن دكتور متخصص',
      body:
          'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.'),
  OnboardingModel(
      image: 'Assets/on2on1.svg',
      title: 'سهولة الحجز',
      body: 'احجز المواعيد بضغطة زرار في أي وقت وفي أي مكان.'),
  OnboardingModel(
      image: 'Assets/on3.svg',
      title: 'آمن وسري',
      body: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.')
];
