package org.springframework.samples.petclinic.owner;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import slack.Slack;
import slack.api.Message;
import slack.api.SendMessage;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api")
public class SlackController {

    @Value("${slack.webhook-url}")
    private String slackWebhookUrl;

    @PostMapping("/send-slack-message")
    public String sendSlackMessage() {
        try {
            Slack slack = Slack.getInstance();
            SendMessage sendMessage = new SendMessage("#test", "Hello from Spring Boot!");
            Message message = slack.call(sendMessage, slackWebhookUrl);
            return "Slack message sent successfully. Message ID: " + message.getTimestamp();
        } catch (Exception e) {
            e.printStackTrace();
            return "Error sending Slack message.";
        }
    }
}
