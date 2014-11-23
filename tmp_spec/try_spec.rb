require File.expand_path('../../tmp_spec/tmp_spec_helper.rb', __FILE__)

describe "RoCell::R4py::C.new" do
  let(:o) do
    RoCell::Py::C.new
  end

  around(:each) do |example|
    Pj.tmply_set_dev do
      example.call
    end
  end

  it :ivk do
    result = o.send(:ivk, :pys, :get, 'rol')
    expect(result).to have_val
    Out.out ""
    Out.out result
  end
end

