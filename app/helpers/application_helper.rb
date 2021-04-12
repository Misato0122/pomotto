module ApplicationHelper
  def default_meta_tags
    {
      site: 'pomotto',
      title: 'todoリストxポモドーロタイマーで時間管理！',
      reverse: false,
      separator: '|',
      description: 'todoリストとポモドーロタイマーを組み合わせて作業効率を上げるアプリです',
      keywords: 'pomotto, todolist, todoリスト, ポモドーロタイマー',
      canonical: 'https://pomotto12345.herokuapp.com/',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('pomottoロゴ.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description, 
        type: 'website',
        url: :canonical,
        image: image_url('pomottoロゴ.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@miii01220',
      }
    }
  end
end