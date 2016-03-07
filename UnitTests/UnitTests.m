
SpecBegin(UnitTests)

__block UIView *sut;

beforeEach(^{
    sut = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
});
  
it(@"artsyGrayLight looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayLight];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGrayRegular looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayRegular];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGrayMedium looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayMedium];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGraySemibold looks right", ^{
    sut.backgroundColor = [UIColor artsyGraySemibold];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGrayBold looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayBold];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyPurpleLight looks right", ^{
    sut.backgroundColor = [UIColor artsyPurpleLight];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyPurpleRegular looks right", ^{
    sut.backgroundColor = [UIColor artsyPurpleRegular];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyRedRegular looks right", ^{
    sut.backgroundColor = [UIColor artsyRedRegular];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyYellowRegular looks right", ^{
    sut.backgroundColor = [UIColor artsyYellowRegular];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyYellowMedium looks right", ^{
    sut.backgroundColor = [UIColor artsyYellowMedium];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyYellowBold looks right", ^{
    sut.backgroundColor = [UIColor artsyYellowBold];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGreenRegular looks right", ^{
    sut.backgroundColor = [UIColor artsyGreenRegular];
    expect(sut).to.haveValidSnapshot();
});
  SpecEnd