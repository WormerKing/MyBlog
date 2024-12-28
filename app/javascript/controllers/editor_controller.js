import { Controller } from "@hotwired/stimulus";
import EditorJS from "@editorjs/editorjs";

// These are the plugins
import Header from "@editorjs/header";
import ImageTool from "@editorjs/image";
import List from "@editorjs/list";
import Paragraph from "@editorjs/paragraph";
import DragDrop from "editorjs-drag-drop";
import InlineCode from "@editorjs/inline-code";
import editorjsCodecup from "@calumk/editorjs-codecup";
import Delimeter from "@coolbytes/editorjs-delimiter";
import Table from "editorjs-table";
import Underline from "@editorjs/underline";
import Undo from "editorjs-undo";
import Alert from "editorjs-alert";
import Warning from "@editorjs/warning";
import Quote from "@editorjs/quote";
import Marker from "@editorjs/marker";

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["hidden_input", "area"];
  static values = {
    readonly: Boolean,
    editorData: String,
    imageUploadUrl: String,
  };

  csrfToken() {
    const metaTag = document.querySelector("meta[name='csrf-token']");
    return metaTag ? metaTag.content : "";
  }
  connect() {
    const initialContent = this.getInitialContent();

    this.editor = new EditorJS({
      // Holder is the target element
      onChange: async () => {
        let content = await this.editor.saver.save();
        this.hidden_inputTarget.value = JSON.stringify(content);
      },
      onReady: () => {
        new Undo({ editor: this.editor });
        new DragDrop(this.editor);
      },
      readOnly: this.readonlyValue,
      holder: this.areaTarget,
      data: initialContent,
      tools: {
        // marker: ColorPlugin,
        quote: {
          class: Quote,
          inlineToolbar: true,
          shortcut: "CMD+SHIFT+O",
          config: {
            quotePlaceholder: "Yorum giriniz",
            captionPlaceholder: "Yorum sahibi",
          },
        },
        warning: {
          class: Warning,
          inlineToolbar: true,
          shortcut: "CMD+SHIFT+W",
          config: {
            titlePlaceholder: "Title",
            messagePlaceholder: "Message",
          },
        },
        alert: Alert,
        marker: Marker,
        underline: Underline,
        table: {
          class: Table,
          inlineToolbar: true,
        },
        delimeter: {
          class: Delimeter,
          config: {
            styleOptions: ["star", "dash", "line"],
            defaultStyle: "star",
            lineWidthOptions: [8, 15, 25, 35, 50, 60, 100],
            defaultLineWidth: 25,
            lineThicknessOptions: [1, 2, 3, 4, 5, 6],
            defaultLineThickness: 2,
          },
        },
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
              byFile: this.imageUploadUrlValue,
            },
            additionalRequestHeaders: {
              "X-CSRF-Token": this.csrfToken(),
            },
          },
        },
      },
    });
  }

  getInitialContent() {
    let body = this.editorDataValue ? JSON.parse(this.editorDataValue) : {};
    return body;
  }

  disconnect() {
    if (this.editor) {
      this.editor = null;
    }
  }
}
