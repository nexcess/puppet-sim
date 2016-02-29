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
          it { is_expected.to contain_class('sim::cron') }
          it { is_expected.to contain_class('sim::config') }
          it { is_expected.to_not contain_shellvar }
          it { is_expected.to contain_file_line('sim cron job').with(
               :ensure => 'present',
               :path   => '/etc/crontab',
               :line   => '*/5 * * * * root /usr/local/sim/sim -q > /dev/null 2>&1',
               :match  => '/usr/local/sim/sim',
             )}
	end

        context "cron_job absent" do
          let(:params) do
            { :cron_job => 'absent'}
          end
          it { is_expected.to contain_file_line('sim cron job').with_ensure('absent') }
	end

        context "custom cron parameters" do
          let(:params) do
            { :crontab     => '/var/spool/cron/root',
              :cron_line   => '*/10 * * * * root /etc/sim/sim',
              :cron_match  => '/etc/sim/sim',
            }
          end
          it { is_expected.to contain_file_line('sim cron job').with(
               :path   => '/var/spool/cron/root',
               :line   => '*/10 * * * * root /etc/sim/sim',
               :match  =>  '/etc/sim/sim',
             )}
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
