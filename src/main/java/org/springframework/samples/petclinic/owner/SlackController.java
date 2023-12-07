package org.springframework.samples.petclinic.owner;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.slack.api.Slack;
import com.slack.api.methods.request.chat.ChatPostMessageRequest;
import com.slack.api.methods.response.chat.ChatPostMessageResponse;

@RestController
@RequestMapping("/api")
public class SlackController {

	@Value("${slack.token}")
	private String slackToken;

	@PostMapping("/send-slack-message")
	public String sendSlackMessage() {
		try {
			Slack slack = Slack.getInstance();
			ChatPostMessageRequest request = ChatPostMessageRequest.builder()
				.channel("#test")
				.text("Hello from Spring Boot!")
				.build();
			ChatPostMessageResponse response = slack.methods(slackToken).chatPostMessage(request);
			return "Slack message sent successfully. Message ID: " + response.getTs();
		}
		catch (Exception e) {
			e.printStackTrace();
			return "Error sending Slack message.";
		}
	}

}
