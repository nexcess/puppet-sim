require 'spec_helper'

describe 'sim' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "sim class without any parameters" do
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('sim::params') }
          it { is_expected.to contain_class('sim::config') }
	end

        context "custom config parameters" do
          let(:params) do
            { :config     => {'DISK_WARN' => {'value' => '85'}},
              :config_file => '/etc/sim/conf.sim',
            }
            
          end
          it { is_expected.to contain_shellvar('DISK_WARN').with(
                 :ensure => 'present',
                 :target => '/etc/sim/conf.sim',
                 :value  => '85',
               )}
	end
      end
    end
  end
  context 'unsupported operating systems' do
    let(:facts) do
      { :operatingsystem => 'Windows'}
    end
    it do
      expect {
       catalogue
      }.to raise_error(Puppet::Error, /supported by sim/)
    end
  end
end
