name             'java_service'
maintainer       'Rally Software Development Corp'
maintainer_email 'rallysoftware-cookbooks@rallydev.com'
license          'MIT'
description      'Installs/Configures java_service'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.1.0'

# include all tested operating systems as part of the supports section
# supports 'centos'
# supports 'ubuntu'

# depends should specify 2 symver places
# depends 'rvm', '~> 0.4'
depends 'java', '~> 1.13'
depends 'bluepill'
