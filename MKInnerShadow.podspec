Pod::Spec.new do |s|
  s.name     = 'MKInnerShadow'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'MKInnerShadow是用来绘制视图的内阴影的快捷工具.'
  s.homepage = 'https://github.com/SYFH/MKInnerShadow'
  s.author   = { 'SYFH' => 'SYFH' }
  s.source   = { :git => 'https://github.com/SYFH/MKInnerShadow.git', :tag => s.version }
  s.platform = :ios, '7.0'
  s.source_files = 'MKInnerShadow/*.{h,m}'
end