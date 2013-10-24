require_relative 'spec_helper'

describe 'java_service_test::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new(:step_into => ['java-service']).converge 'java_service_test::default' }

  it "should create a pill file for a java command using a class" do
    expect(chef_run).to create_file_with_content '/etc/bluepill/echoserver.pill', echoserver_pill_file
  end

  it "should create a pill file for a java command using a jar file" do
    expect(chef_run).to create_file_with_content '/etc/bluepill/echoserver2.pill', echoserver2_pill_file
  end
end

def echoserver_pill_file
  <<-PILL.strip
# -*- mode: ruby -*-
Bluepill.application("echoserver") do |app|
  app.process("echoserver") do |process|
    process.start_command = %q{java -classpath /root/server.jar -Dport=9999 -server -Xms256m -XX:+UseConcMarkSweepGC EchoServer foo bar}
    process.pid_file = "/tmp/echoserver.pid"
    process.uid = "root"
    process.gid = "root"
    process.daemonize = true  
  end
end
PILL
end

def echoserver2_pill_file
  <<-PILL.strip
# -*- mode: ruby -*-
Bluepill.application("echoserver2") do |app|
  app.process("echoserver2") do |process|
    process.start_command = %q{java -Dport=9989 -server -Xms256m -XX:+UseConcMarkSweepGC -jar /root/server.jar foo bar}
    process.pid_file = "/tmp/echoserver2.pid"
    process.uid = "root"
    process.gid = "root"
    process.daemonize = true  
  end
end
PILL
end
