import { Controller } from "@hotwired/stimulus";
import EditorJS from "@editorjs/editorjs";

// These are the plugins
import CodeTool from "@editorjs/code";
import Header from "@editorjs/header";
import ImageTool from "@editorjs/image";
import List from "@editorjs/list";
import Paragraph from "@editorjs/paragraph";
import DragDrop from "editorjs-drag-drop";
import InlineCode from "@editorjs/inline-code";
import editorjsCodecup from "@calumk/editorjs-codecup";
import ColorPlugin from "editorjs-text-color-plugin";
import Marker from "@editorjs/marker";

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["editor_content"];
  static values = {
    readOnly: Boolean,
    imageUploadUrl: String,
  };

  csrfToken() {
    const metaTag = document.querySelector("meta[name='csrf-token']");
    console.log(metaTag);
    return metaTag ? metaTag.content : "";
  }
  connect() {
    console.log("Hello, Stimulus!", this.element);
    console.log(this.imageUploadUrlValue);

    const initialContent = this.getInitialContent();

    this.contentEditor = new EditorJS({
      // Holder is the target element
      onReady: () => {
        // new Undo({ editor: this.editor });
        new DragDrop(this.contentEditor);
      },
      readOnly: this.readOnly,
      holder: this.editor_contentTarget,
      data: initialContent,
      tools: {
        header: {
          class: Header,
        },
        list: {
          class: List,
        },
        paragraph: {
          class: Paragraph,
          config: {
            inlineToolbar: true,
          },
        },
        inlineCode: InlineCode,
        code: editorjsCodecup, //CodeTool,
        image: {
          class: ImageTool,
          config: {
            endpoints: {
              byFile: this.imageUploadUrlValue, // `/panel/yazilarim/upload_image`,
            },
            additionalRequestHeaders: {
              "X-CSRF-Token": this.csrfToken(),
            },
          },
        },
      },
    });

    this.element.addEventListener("submit", this.saveEditorData.bind(this));
  }

  getInitialContent() {
    const hiddenContentField = document.getElementById("editor_content_hidden");
    if (hiddenContentField && hiddenContentField.value) {
      return JSON.parse(hiddenContentField.value);
    }
    return {};
  }

  async saveEditorData(event) {
    event.preventDefault();

    const outputData = await this.contentEditor.save();
    const articleForm = this.element;

    const hiddenInput = document.getElementById("editor_content_hidden");

    hiddenInput.value = JSON.stringify(outputData);
    articleForm.submit();
  }

  disconnect() {
    if (this.contentEditor) {
      this.contentEditor = null;
    }
  }
}
