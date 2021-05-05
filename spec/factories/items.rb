FactoryBot.define do
  factory :item do
    title              {'スニーカー '}
    text               {'特に目立った傷や汚れ等なく、まだまだ使っていただけると思います。'}
    price              {98765}
    state_id           {2}
    category_id        {3}
    postage_id         {3}
    prefecture_id      {3}
    shipping_day_id    {3}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end