def remove_null_items_recursive(d: dict):
    # Create a new dictionary to store the non-null items
    cleaned_dict = {}

    for key, value in d.items():
        # Check if the value is a dictionary
        if isinstance(value, dict):
            # Recursively call the function for nested dictionaries
            cleaned_value = remove_null_items_recursive(value)
            # Add the cleaned value to the cleaned_dict if it's not empty
            if cleaned_value:
                cleaned_dict[key] = cleaned_value
        # Check if the value is not None
        elif value is not None and value != [] and value != {} and value != '':
            cleaned_dict[key] = value
        
    return cleaned_dict