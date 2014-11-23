require 'rails_helper'

describe "RoCell::R4py::TestAttrs.new" do
  let(:o) do
    RoCell::Py::TestAttrs.new
  end

  before(:each) do
    cdfix "try_py/rb"
    RoFakerPlus.flow do |f|
      f.fix "try_py/setup.py", <<-CONTENT
    other line2,
    packages=[
        'ro'
    ],
    other line2
      CONTENT
    end
  end

  it :pkg_mod do
    result = o.send(:pkg_mod )
  end
end
