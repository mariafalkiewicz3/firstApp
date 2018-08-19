if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_WVcNh4X56OYByCeCx1585xZP',
    secret_key: 'sk_test_GHAu37H9rAIpHku83dl5Piot'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]