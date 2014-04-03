# Copyright (c) 2014 Pierre Paysant-Le Roux
 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'redmine'
require 'svn/client'

require_dependency 'repository/subversion'

Rails.configuration.to_prepare do
  Repository::Subversion.class_eval do
    def self.scm_adapter_class
      Redmine::Scm::Adapters::SubversionLibsvnAdapter
    end
  end
end

Redmine::Plugin.register :libsvn do
  name 'Libsvn'
  author 'Pierre Paysant-Le Roux'
  description 'Use libsvn as a backend to access Subversion repositories'
  url 'https://github.com/SenH/redmine-libsvn'
  version '0.0.2'
  settings :default => {'trust_server_cert' => '0'}, :partial => 'settings/lib_svn_settings'
  
  requires_redmine :version_or_higher => '2.0.0'
end
