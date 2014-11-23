require 'spec_helper'
require 'ro_cell/pl2/sv'

describe "RoCell::R4py::C.new" do
  let(:o) do
    RoCell::Py::C.new
  end

  attr_writer :sv

  def sv
    @sv ||= ::RoCell::Pl2::Sv.new
  end

  before do
    cdfix "c"
    sv.restart
  end

  describe :ivk do
    it 'case' do
      result = o.send(:ivk, :pys, :get, 'rol')
      result = RoFile.filename(result)
      expect(result).to eq("ro_cmds_light")
    end

    it 'case2' do
      result = o.send(:ivk, :pys, :get, 'ro')
      result = RoFile.filename(result)
      expect(result).to eq("ro")
    end

    it "case3" do
      result = o.send(:ivk, :pys, :get, 'rp')
      result = RoFile.filename(result)
      expect(result).to eq("ro")
    end
  end
end

