--Webhook Module by ocean#9067

local Webhook = {};
Webhook.__index = Webhook;

function Webhook.new(webhook, content)
    local WebhookData = setmetatable({}, Webhook);

    local WebhookInformation = syn.request({
        Url = webhook;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    }).Body;

    WebhookInformation = game:GetService'HttpService':JSONDecode(WebhookInformation);

    WebhookData.Webhook = webhook;
    WebhookData.Id = WebhookInformation.id;
    WebhookData.Token = WebhookInformation.token;
    WebhookData.PostContent = content;

    return WebhookData;
end;

function Webhook:Post()
    local SendData = syn.request({
        Url = self.Webhook.."?wait=true";
        Method = "POST";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = game:GetService'HttpService':JSONEncode(self.PostContent);
    });

    self.MessageId = game:GetService'HttpService':JSONDecode(SendData.Body)["id"];

    return SendData;
end;

function Webhook:Edit(content)
    assert(self.MessageId, "Attempt to edit a non-existing message")

    return syn.request({
        Url = string.format("https://discord.com/api/webhooks/%s/%s/messages/%s", self.Id, self.Token, self.MessageId);
        Method = "PATCH";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = game:GetService'HttpService':JSONEncode(content);
    });
end;

function Webhook:GetContent()
    return self.PostContent;
end;

function Webhook:Clone()
    return table.clone(self);
end;

return Webhook;
