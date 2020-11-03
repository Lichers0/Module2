module EnumHelper
  def options_for_enum(object, enum, default_value = '')
    options = enum_to_i18n_options_array(object.class.name, enum.to_s)
    options_for_select(options, default_value)
  end

  def enum_to_i18n_options_array(klass, enum)
    klass.classify.safe_constantize.
      send(enum.pluralize).map do |key, _|
      [I18n.t("activerecord.enums.#{klass.underscore}.#{enum}.#{key}"), key]
    end
  end
end