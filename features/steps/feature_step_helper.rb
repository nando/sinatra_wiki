module FeatureStepHelper
  
  def feature_place_to_app_path(place)
      case place.downcase
      when 'the home' then "/"
      else place
      end
  end
  
  def try_if_try(try, eval_str)
    eval eval_str
  rescue
    raise if try.blank?
  end
  
end
