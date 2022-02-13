# frozen_string_literal: true

require 'spec_helper'
require './app/compress'

describe Compressor do
  describe '#compress' do
    it { expect(subject.compress(nil)).to eq '' }
    it { expect(subject.compress('')).to eq '' }
    it { expect(subject.compress('a')).to eq 'a' }
    it { expect(subject.compress('aa')).to eq 'aa' }
    it { expect(subject.compress('aaa')).to eq 'a3' }
    it { expect(subject.compress('describe')).to eq 'describe' }
    it { expect(subject.compress('aaa')).to eq 'a3' }
    it { expect(subject.compress('aaabbccc')).to eq 'a3bbc3' }
    it { expect(subject.compress('abbbbccc')).to eq 'ab4c3' }
  end

  describe '#decompress' do
    it { expect(subject.decompress('a3')).to eq 'aaa' }
    it { expect(subject.decompress('a3bbc3')).to eq 'aaabbccc' }
    it { expect(subject.decompress('a11b')).to eq 'aaaaaaaaaaab' }
    it { expect(subject.decompress('describe')).to eq 'describe' }
    it { expect(subject.decompress('ab4c3')).to eq 'abbbbccc' }
    it { expect(subject.decompress('a')).to eq 'a' }
    it { expect(subject.decompress('a3b')).to eq 'aaab' }
    it { expect(subject.decompress('a1')).to eq 'a' }
    it { expect(subject.decompress('a2')).to eq 'aa' }
    it { expect(subject.decompress('a3')).to eq 'aaa' }
    it { expect(subject.decompress(nil)).to eq '' }
    it { expect(subject.decompress('')).to eq '' }
    it { expect(subject.decompress('3a5')).to eq 'aaaaa' }
  end
end
