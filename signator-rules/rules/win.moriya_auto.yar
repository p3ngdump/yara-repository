rule win_moriya_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.moriya."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.moriya"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 7754 448d62ff 453bf4 7344 412bd6 ffca 4c8d0492 }
            // n = 7, score = 100
            //   7754                 | inc                 ebp
            //   448d62ff             | sub                 eax, esi
            //   453bf4               | inc                 ecx
            //   7344                 | lea                 eax, [eax - 1]
            //   412bd6               | dec                 esp
            //   ffca                 | imul                eax, eax, 0x138
            //   4c8d0492             | inc                 ecx

        $sequence_1 = { 803b0e 0f85b7000000 807b0100 0f85ad000000 817b1803001200 0f85a0000000 }
            // n = 6, score = 100
            //   803b0e               | or                  byte ptr [ebx + 3], 0xe0
            //   0f85b7000000         | dec                 eax
            //   807b0100             | mov                 dword ptr [ebx + 0x38], eax
            //   0f85ad000000         | dec                 eax
            //   817b1803001200       | lea                 edx, [ebp - 0x40]
            //   0f85a0000000         | dec                 eax

        $sequence_2 = { ff15???????? 488b8c2498000000 4885c9 7405 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   488b8c2498000000     | mov                 ebx, edx
            //   4885c9               | xor                 edx, edx
            //   7405                 | lea                 ecx, [edx + 0x4d]

        $sequence_3 = { 7346 452bc6 418d40ff 4c69c038010000 418d5601 4869d238010000 }
            // n = 6, score = 100
            //   7346                 | test                edi, edi
            //   452bc6               | jns                 0x1fcf
            //   418d40ff             | je                  0x1f73
            //   4c69c038010000       | mov                 eax, dword ptr [edi + 8]
            //   418d5601             | dec                 eax
            //   4869d238010000       | mov                 dword ptr [ebx + 0x38], eax

        $sequence_4 = { 488d4c2470 ff15???????? 488d052d280000 4533c9 4889442438 }
            // n = 5, score = 100
            //   488d4c2470           | dec                 ebp
            //   ff15????????         |                     
            //   488d052d280000       | mov                 edi, dword ptr [esi + 0x28]
            //   4533c9               | inc                 ebp
            //   4889442438           | mov                 esi, dword ptr [esi + 0x68]

        $sequence_5 = { 4c2bc1 48f7d9 f30f6f4410f0 f30f7f40f0 4803c8 }
            // n = 5, score = 100
            //   4c2bc1               | and                 dword ptr [esp + 0x20], 0
            //   48f7d9               | dec                 eax
            //   f30f6f4410f0         | mov                 ecx, ebx
            //   f30f7f40f0           | xor                 edx, edx
            //   4803c8               | xor                 edx, edx

        $sequence_6 = { 4983f84f 734f 4d8bc8 49c1e903 7411 488b4411f8 4883e908 }
            // n = 7, score = 100
            //   4983f84f             | mov                 dword ptr [eax + ecx - 8], edx
            //   734f                 | dec                 ecx
            //   4d8bc8               | sub                 ecx, 8
            //   49c1e903             | jne                 0x706
            //   7411                 | dec                 ecx
            //   488b4411f8           | cmp                 eax, 8
            //   4883e908             | jb                  0x75e

        $sequence_7 = { 48894720 488b4b38 48894f08 488b4b40 48894f10 8a4303 }
            // n = 6, score = 100
            //   48894720             | inc                 ecx
            //   488b4b38             | movzx               eax, word ptr [ecx + 8]
            //   48894f08             | movzx               ecx, al
            //   488b4b40             | shl                 ecx, 8
            //   48894f10             | dec                 esp
            //   8a4303               | lea                 ecx, [0x211a]

        $sequence_8 = { 4c89b424a0000000 4c89742438 4d8bfe 4c898424a8000000 33db 395a30 }
            // n = 6, score = 100
            //   4c89b424a0000000     | xor                 ecx, ecx
            //   4c89742438           | dec                 eax
            //   4d8bfe               | add                 edx, 4
            //   4c898424a8000000     | dec                 eax
            //   33db                 | mov                 esi, eax
            //   395a30               | mov                 edx, dword ptr [edi + 8]

        $sequence_9 = { 48c1ea04 89542430 448bf3 895c2424 443bf2 0f838e000000 }
            // n = 6, score = 100
            //   48c1ea04             | dec                 eax
            //   89542430             | xor                 ecx, esp
            //   448bf3               | dec                 eax
            //   895c2424             | mov                 ebx, dword ptr [esp + 0x60]
            //   443bf2               | and                 dword ptr [ebx + 0x30], 0
            //   0f838e000000         | dec                 eax

    condition:
        7 of them and filesize < 58368
}