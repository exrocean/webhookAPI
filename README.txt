Exploit Webhook API by ocean
Made to use the Discord Webhook API easily within exploits

To get started, require the module:

local Webhook = loadstring(game:HttpGet("https://raw.githubusercontent.com/exrocean/Exploit-Webhook-API/main/source.lua"))();

Then create a "new" webhook

local OurWebhook = Webhook.new(<string> YourWebhookUrl, <table> WebhookContent); --Returns a webhook instance

This creates a new webhook "instance" that can be manipulated
To send a post request to the webhook, call :Post() on the webhook, Example:

OurWebhook:Post(); --Returns the post data of the post

Note: After calling post on a webhook object, that webhook objected can not be posted again. Refer to Webhook:Clone() to post again.
To edit a webhooks post, call :EditPost(<table> NewWebhookContent) on the webhook, Example:

OurWebhook:EditPost({ --Returns the post data of the edit
    ["content"] = "Hello, World!";
});

Note: This will override a previous message from the webhook with the content provided.
To edit a webhooks message and not post, call :EditMessage(<table> NewWebhookContent) on the webhook, Example:

OurWebhook:EditContent({ --Returns the webhook instance
    ["content"] = "Hello, World!";
});

Note: This will not edit the message sent by the webhook, and only changes its content internally.
To clone and create a duplicate of a webhook, call :Clone() on the webhook, Example:

local OurClonedWebhook = OurWebhook:Clone(); --Returns a cloned webhook instance

Note: Cloned webhooks can be edited just like any other webhook instance.
To get the content of a webhook, call :GetContent() on the webhook, Example:

local OurWebhooksContent = OurWebhook:GetContent(); --Returns content of a webhook instance
