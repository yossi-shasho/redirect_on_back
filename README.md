# Redirect on Back

Prevent re-submission of a form after clicking back button. Rails 3.1 and above.

### Example Scenario

1. User fills form and hits 'submit';
2. User hits 'back';
3. User changes a field and hits 'submit' again;
4. Arrrggg... a new record has been created instead of updating the existing one.

## Installation (Rails 3.1 and higher)

Add this line to your application's Gemfile:

    gem 'redirect_on_back'

Then execute:

    $ bundle


And then specify the use of the redirect_on_back
javascripts in your `application.js`:

    //= require redirect_on_back

## Usage

In a controller action, choose where to navigate the users if they click 'back':
```ruby
redirect_on_back_to a_safe_path
```


Full example:

```ruby
 def create
    @user = User.new(user_params)
    if @user.save
      redirect_on_back_to edit_user_path(@user) # If user hits 'back' he'll be redirected to edit_user_path
      redirect_to @user
    else
      render :new
    end
  end
```

## How to Disable

redirect_on_back uses a hidden form field, which is automatically added to forms.
However, it's not added to forms that point to different domains, so, for instance, it won't interfere with Amazon S3 file uploads.

To manually disable it in a form, add `disable_redirect_on_back: true` to the `data` hash of that form:

```erb
   form_tag @user, data: {disable_redirect_on_back: true}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
