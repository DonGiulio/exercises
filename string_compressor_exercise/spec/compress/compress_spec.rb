require 'spec_helper'

describe Compressor do

  describe '#compress' do

    it { subject.compress(nil).should eq "" }
    it { subject.compress('').should eq '' } 
    it { subject.compress("a").should eq "a" } 
    it { subject.compress("aa").should eq "aa" } 
    it { subject.compress("aaa").should eq "a3" } 
    it { subject.compress('describe').should eq 'describe' } 
    it { subject.compress('aaa').should eq 'a3' } 
    it { subject.compress('aaabbccc').should eq 'a3bbc3' }
    it { subject.compress('abbbbccc').should eq 'ab4c3' }
  end

  describe '#decompress' do
  
    it { subject.decompress('a3').should eq 'aaa' }
    it { subject.decompress('a3bbc3').should eq 'aaabbccc' }
    it { subject.decompress('a11b').should eq 'aaaaaaaaaaab' }
    it { subject.decompress('describe').should eq "describe" }
    it { subject.decompress('ab4c3').should eq 'abbbbccc' }
    it { subject.decompress('a').should eq "a" }
    it { subject.decompress('a3b').should eq "aaab" }
    it { subject.decompress('a1').should eq "a" }
    it { subject.decompress('a2').should eq "aa" }
    it { subject.decompress('a3').should eq "aaa" }
    it { subject.decompress(nil).should eq "" }
    it { subject.decompress("").should eq "" }
    it { subject.decompress("3a5").should eq "aaaaa" }
  end
  
end
