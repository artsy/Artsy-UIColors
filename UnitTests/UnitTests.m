
SpecBegin(UnitTests)

__block UIView *sut;

beforeEach(^{
    sut = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
});
  
it(@"artsyGrayLightest looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayLightest];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGrayLighter looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayLighter];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGray looks right", ^{
    sut.backgroundColor = [UIColor artsyGray];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGrayDark looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayDark];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGrayDarker looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayDarker];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGrayDarkest looks right", ^{
    sut.backgroundColor = [UIColor artsyGrayDarkest];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyPurpleLight looks right", ^{
    sut.backgroundColor = [UIColor artsyPurpleLight];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyPurple looks right", ^{
    sut.backgroundColor = [UIColor artsyPurple];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyRedLight looks right", ^{
    sut.backgroundColor = [UIColor artsyRedLight];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyRed looks right", ^{
    sut.backgroundColor = [UIColor artsyRed];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyYellowLight looks right", ^{
    sut.backgroundColor = [UIColor artsyYellowLight];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyYellow looks right", ^{
    sut.backgroundColor = [UIColor artsyYellow];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGreenLight looks right", ^{
    sut.backgroundColor = [UIColor artsyGreenLight];
    expect(sut).to.haveValidSnapshot();
});
  
it(@"artsyGreen looks right", ^{
    sut.backgroundColor = [UIColor artsyGreen];
    expect(sut).to.haveValidSnapshot();
});

  SpecEnd