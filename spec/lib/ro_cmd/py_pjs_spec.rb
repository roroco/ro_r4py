require 'rails_helper'

describe "::RoCmd::PyNav" do
  let(:o) do
    ::RoCmd::Pys.new
  end

  before do
    cdfix "py_nav"
  end

  it :get do
    result = o.send(:get, "rol")
    result = RoFile.filename(result)
    expect(result).to eq("ro_cmds_light")
  end
end

